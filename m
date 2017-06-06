From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 6 Jun 2017 10:17:11 +0200
Subject: [Buildroot] GIT download helper and submodules versioning
In-Reply-To: <CANQCQpY7E8F3ZVnXRKSBy4-rnAL3eOQ+jWRcUzeZH9ivwthpww@mail.gmail.com>
References: <CANQCQpY7E8F3ZVnXRKSBy4-rnAL3eOQ+jWRcUzeZH9ivwthpww@mail.gmail.com>
Message-ID: <d90a3fc9-dfa9-9195-4f79-f891c60f1e11@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/06/2017 04:39, Matthew Weber wrote:
> I believe the current submodule args needs an additional --remote arg.
> This allows you to set versioning/branches to pull in your .gitmodules
> file and the --remote forces it to fetch the latest tips of that
> branch.

The version of the submodule is already in the parent git repository
as a hash. See "git rev-parse HEAD:./yoursubmoduledir" in the parent
repository.

If you do not respect this version, many packages will fail to build
if the updated submodule have incompatible changes.

The --remote option is intended for upstream to update its
dependencies.  If you use --remote and it fetches new commits, then
notice how "git status" will tell you that your submodule is modified,
and that you have to run git add and git commit to record the new
submodule version.
