From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:20:43 +0200
Subject: [Buildroot] [PATCH v3] mariadb: bump version to 10.2.17
In-Reply-To: <20180821155536.21178-1-bluemrp9@gmail.com>
References: <20180821155536.21178-1-bluemrp9@gmail.com>
Message-ID: <20180821232043.6320d87b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 08:55:36 -0700, Ryan Coe wrote:
> Release notes: https://mariadb.com/kb/en/mariadb-10217-release-notes/
> Changelog: https://mariadb.com/kb/en/mariadb-10217-changelog/
> 
> Note that HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled has been changed to
> HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF in order to prevent the following
> configure error:
> 
> CMake Error at /usr/share/cmake-3.11/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>   Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>   (Required is at least version "3.3.24")
> Call Stack (most recent call first):
>   /usr/share/cmake-3.11/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>   /usr/share/cmake-3.11/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>   libmariadb/CMakeLists.txt:303 (FIND_PACKAGE)
> 
> RocksDB is also disabled to prevent the following build error in some
> configurations:
> 
> ./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:327:38: error: field 'result' has incomplete type 'std::promise<rocksdb::BackupEngineImpl::CopyOrCreateResult>'
>      std::promise<CopyOrCreateResult> result;
> 
> ./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:378:37: error: field 'result' has incomplete type 'std::future<rocksdb::BackupEngineImpl::CopyOrCreateResult>'
>      std::future<CopyOrCreateResult> result;
> 
> ./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:425:37: error: field 'result' has incomplete type 'std::future<rocksdb::BackupEngineImpl::CopyOrCreateResult>'
>      std::future<CopyOrCreateResult> result;
> 
> ./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc: In member function 'rocksdb::Status rocksdb::BackupEngineImpl::AddBackupFileWorkItem(std::unordered_set<std::basic_string<char> >&, std::vector<rocksdb::BackupEngineImpl::BackupAfterCopyOrCreateWorkItem>&, rocksdb::BackupID, bool, const string&, const string&, rocksdb::RateLimiter*, uint64_t, uint64_t, bool, std::function<void()>, const string&)':
> ./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:1366:38: error: aggregate 'std::promise<rocksdb::BackupEngineImpl::CopyOrCreateResult> promise_result' has incomplete type and cannot be defined
>      std::promise<CopyOrCreateResult> promise_result;
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
> Changes v2 - v3:
>   - Bump version from 10.2.16 to 10.2.17
>   - Fix build error by disabling RocksDB (discovered by Thomas Petazzoni)
>   - Rebased against master
> Changes v1 - v2:
>   - No change
> ---
>  package/mariadb/mariadb.hash | 12 ++++++------
>  package/mariadb/mariadb.mk   | 14 +++++++++++---
>  2 files changed, 17 insertions(+), 9 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
