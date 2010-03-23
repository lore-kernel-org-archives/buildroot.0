From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Mar 2010 10:39:22 +0100
Subject: [Buildroot] Qt error.
In-Reply-To: <f70863321003230201l3573678cx3eaf40954eec82dc@mail.gmail.com>
References: <f70863321003230201l3573678cx3eaf40954eec82dc@mail.gmail.com>
Message-ID: <20100323103922.1c5a2917@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Mar 2010 11:01:24 +0200
Muhammed ER <er.muhammed@gmail.com> wrote:

> In "qt.mk" file,
> I commet
> line 489 #        -nomake examples \
> line 490 #        -nomake demos \

Because you want examples and demos, right ?

> So it tries to install /usr which is in MY PC.
> 
> I think,
> line 485:       -prefix /usr \
> and it doesn't write because of permissions.
> 
> will be $(TARGET)/usr or something like this.

No, -prefix /usr is ok, because Qt will be installed as /usr on the
target. -hostprefix is already set to $(STAGING_DIR)/usr, where it will
be installed by "make install".

Can you report the exact error message you're having ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
