From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 14 Mar 2016 10:45:50 -0700
Subject: [Buildroot] Another lame user question.
In-Reply-To: <20160314053654.GF7678@tarshish>
References: <CAJJ6jxvqALyD4=1wPUdh7JKpv1fKkfoYcj-m4FZLe+1P2wnnFQ@mail.gmail.com>
 <20160314053654.GF7678@tarshish>
Message-ID: <CAJJ6jxs-aPoTBv6OMoKkKN64OAscmG41dTCqrqsB6xkVSnAD+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 13, 2016 at 10:36 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Steve,
>
> On Sun, Mar 13, 2016 at 10:14:57PM -0700, Steve Calfee wrote:
>> Hi, as the title says, I have another user question. I did explore
>> google and the buildroot docs.
>>
>> I am trying to move the mysql directories to my writeable ubi
>> partition. Somewhere someone create the mysql user. Where did it get
>> created? However, there is no mysql group. I cannot get mysql to start
>> from a ubi partition mounted at /data/mysql. Who and where is the
>> mysql user created (some files have that as a user)
>>
>> The buildroot manual documents the makeusers syntax, but what file do
>> I create where? Will that work for mysql?
>
> Quoting package/mysql/mysql.mk:
>
> define MYSQL_USERS
>         mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
> endef
>
> baruch
>
Hi Baruch, thanks.

So somewhere in the infra a script goes through all *_USERS variables
and builds the password file etc for users?

What if I want to move /var/mysql? Who uses /var/mysql as the "home"
directory? And how does that relate to datadir that is defined in
my.cnf?

Anyway finding out that the user is created in the make file will
really help me research this problem of setting up mysql and moving
its datadir to another ubi partition.

Thanks, Steve
