From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 22 Jun 2015 16:03:32 +0200
Subject: [Buildroot] [PATCH] openvmtools: fix legal info
In-Reply-To: <5586A95F.4010501@zacarias.com.ar>
References: <1434885903-22713-1-git-send-email-gustavo@zacarias.com.ar>
 <CABbD_XDeC4jX6bS7wtjRpXoSNv6VSLTywhyJEx5K+gQw7-XSUg@mail.gmail.com>
 <5586A95F.4010501@zacarias.com.ar>
Message-ID: <558815B4.5010208@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo,

Gustavo Zacarias wrote:
>
>
> On 21/06/15 09:05, K?roly Kasza wrote:
>
>> Hi Gustavo, all,
>>
>> sorry, I missed this one.
>
> Hi all.
> I wonder if it wouldn't be better to just use subdir in the legal info,

Looks like a good idea, but...

> i don't think there's any package using/needing to fetch the files
> outside of it.

...we have them! :( Here's a couple examples:

$ git grep -E '_(LICENSE_FILES|SUBDIR) =' -- package/samba 
package/berkeleydb/
package/berkeleydb/berkeleydb.mk:BERKELEYDB_SUBDIR = build_unix
package/berkeleydb/berkeleydb.mk:BERKELEYDB_LICENSE_FILES = LICENSE
package/samba/samba.mk:SAMBA_SUBDIR = source3
package/samba/samba.mk:SAMBA_LICENSE_FILES = COPYING
$

Setting SAMBA_LICENSE_FILES to ../COPYING does not look very nice to me.

-- 
Luca
