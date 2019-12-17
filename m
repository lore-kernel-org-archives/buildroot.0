From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 16 Dec 2019 16:03:49 -0800
Subject: [Buildroot] [PATCH v2 2/3] package/mariadb: update startup
 scripts
In-Reply-To: <20191216093535.08ca160d@windsurf.home>
References: <20191215213326.10863-1-bluemrp9@gmail.com>
 <20191215213326.10863-2-bluemrp9@gmail.com>
 <20191216093535.08ca160d@windsurf.home>
Message-ID: <145ed763-08f3-c71d-e306-8b16586d6f1d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 12/16/19 12:35 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Sun, 15 Dec 2019 13:33:25 -0800
> Ryan Coe <bluemrp9@gmail.com> wrote:
>
>> The init scripts have been modified to create a directory under
>> /var/log/mysql and specify mysqld to use it for logging. The directory
>> test to call mysql_install_db has been redirected to /dev/null to prevent
>> an error message from showing if /var/lib/mysql does not exist.
>>
>> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> A commit title that says "update startup scripts" is a good hint that
> the splitting of changes is not good. It hints that you're doing
> several things at once in the same commit, which are unrelated to each
> other.
>
> There are (at least?) three independent changes here:
>
>   - Redirection of stderr when listing $MYSQL_LIB
>
>   - Rename of the MYSQL_PID variable
>
>   - Move the logs to /var/log/mysql
>
> Three independent changes should lead to three independent commits.
I will re-submit.
>
> Thanks!
>
> Thomas
