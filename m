From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue, 21 Mar 2017 19:25:29 -0300
Subject: [Buildroot] [PATCH] irssi: add patch to fix static linking
In-Reply-To: <22310065-0e30-32bc-e1a3-9957ac59d791@mind.be>
References: <20170321034553.5357-1-rprebello@gmail.com>
 <22310065-0e30-32bc-e1a3-9957ac59d791@mind.be>
Message-ID: <CABLs7GVuZk7AFTFZA6z=o7w=N7Zvwz1QFSDaG9k8NoCw9AWcTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

2017-03-21 5:41 GMT-03:00 Arnout Vandecappelle <arnout@mind.be>:
>
>  Is it useful to fall back to the non-pkg-config case? Due to glib2, pkg-config
> is a hard requirement now, so this would only be to support pre-pkg-config
> openssl versions, and I believe those are so ancient that they likely would
> break API. I didn't actually check that, however.
>

I had originally considered discarding the non-pkg-config method
entirely, but since the upstream commit that touched that part of the
configure script and caused the regression explicitly preserved the
test involving AC_CHECK_LIB, I thought that maybe the author had a
good reason for that, like supporting old OpenSSL versions, as you
said, which still work with the current version of Irssi.

Anyway, let's see if the Irssi devs will mention anything in that
regard when they review the PR I've submitted.

Thanks for reviewing this, by the way!

Regards,
Rodrigo
