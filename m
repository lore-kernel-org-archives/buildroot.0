From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Oct 2015 11:09:25 -0300
Subject: [Buildroot] [PATCH] mplayer: needs zlib
In-Reply-To: <561E6193.1030208@imgtec.com>
References: <1444730313-34190-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151013225708.3aa5e0aa@free-electrons.com>
 <561E5F04.9020607@zacarias.com.ar> <561E6193.1030208@imgtec.com>
Message-ID: <561E6215.1000201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/15 11:07, Vicente Olivert Riera wrote:

> and why not disable apng and tdsc unconditionally? As you said, "these
> formats are unlikely to normally be used via mplayer", so if someone
> needs support for them, a future patch could do the work.
>
> Regards,
>
> Vincent.

Hi Vincent.
Well, you could just do:

ifeq ($(BR2_PACKAGE_ZLIB),y)
MPLAYER_DEPENDENCIES += zlib
else
MPLAYER_CONF_OPTS += --disable-decoder=apng --disable-encoder=apng 
--disable-decoder=tdsc
endif

Can't you?
Regards.
