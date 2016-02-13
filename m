From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Sat, 13 Feb 2016 02:52:40 +0100
Subject: [Buildroot] [PATCH] Don't install in mysql directory
In-Reply-To: <20160212104822.776f573f@free-electrons.com>
References: <1450051027-23633-1-git-send-email-arnout@mind.be>
 <20151229212831.07ec737f@free-electrons.com> <56BDA833.4080506@proximus.be>
 <20160212104822.776f573f@free-electrons.com>
Message-ID: <56BE8C68.3050409@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 12/02/2016 om 10:48 schreef Thomas Petazzoni:
> Hello,
>
> On Fri, 12 Feb 2016 10:38:59 +0100, Johan Sagaert wrote:
>
>> I noticed that the ld.so.conf is not working so i just created a
>> symbolic link in /usr/lib pointing to libmysqlclient.so.16
> Can you be more specific about the problem you encountered?
>
> Normally, thanks to Arnout's patch, libmysqlclient.so should be
> installed in /usr/lib directly, which removes the need for ld.so.conf.
>
> Best regards,
>
> Thomas

Dear Thomas

My app complained not finding libmysqlclient.so.16 because it was in 
/usr/lib/mysql,
and that the ld.so.conf content was not having any effect.
So i just created a symlink  in /usr/lib to 
/usr/lib/mysql/libmysqlclient.so.16
I did not change the location of the lib files.

As i sidenote, when Mysql SERVER is not selected, i think that the files 
under /usr/share/mysql
may be removed.

Best  regards
Johan
