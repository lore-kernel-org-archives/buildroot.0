From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 14 Mar 2016 07:36:54 +0200
Subject: [Buildroot] Another lame user question.
In-Reply-To: <CAJJ6jxvqALyD4=1wPUdh7JKpv1fKkfoYcj-m4FZLe+1P2wnnFQ@mail.gmail.com>
References: <CAJJ6jxvqALyD4=1wPUdh7JKpv1fKkfoYcj-m4FZLe+1P2wnnFQ@mail.gmail.com>
Message-ID: <20160314053654.GF7678@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Sun, Mar 13, 2016 at 10:14:57PM -0700, Steve Calfee wrote:
> Hi, as the title says, I have another user question. I did explore
> google and the buildroot docs.
> 
> I am trying to move the mysql directories to my writeable ubi
> partition. Somewhere someone create the mysql user. Where did it get
> created? However, there is no mysql group. I cannot get mysql to start
> from a ubi partition mounted at /data/mysql. Who and where is the
> mysql user created (some files have that as a user)
> 
> The buildroot manual documents the makeusers syntax, but what file do
> I create where? Will that work for mysql?

Quoting package/mysql/mysql.mk:

define MYSQL_USERS
        mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
endef

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
