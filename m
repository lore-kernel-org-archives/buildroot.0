From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Dec 2010 15:00:52 +0100
Subject: [Buildroot] Build failure on msgfmt
In-Reply-To: <393933.14584.qm@web121804.mail.ne1.yahoo.com>
References: <393933.14584.qm@web121804.mail.ne1.yahoo.com>
Message-ID: <20101220150052.662a3707@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Dec 2010 12:52:19 -0800 (PST)
Joe <lordvictory1@yahoo.com> wrote:

> /usr/bin/msgfmt -o test.mo ./de.po; \
>         /bin/mkdir -p de/LC_MESSAGES; \
>         cp -f test.mo de/LC_MESSAGES
> ./de.po:15: keyword "msgctxt" unknown
> ./de.po:15:8: parse error
> /usr/bin/msgfmt: found 2 fatal errors
> cp: cannot stat `test.mo': No such file or directory
> make[5]: *** [test.mo] Error 1

This is because your gettext package from your distribution is too old,
and msgfmt doesn't understand some newer keywords of the libglib2 .po
files.

Peter, maybe we should build gettext for the host instead of relying on
the distribution msgfmt ? What do you think ? Or should be add a check
to verify that msgfmt is sufficiently recent ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
