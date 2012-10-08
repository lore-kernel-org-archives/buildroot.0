From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Oct 2012 21:13:25 +0200
Subject: [Buildroot] [PATCH v9 02/10] perl: new package
In-Reply-To: <CAB0FRsuzTXvxs-t=sVTws2u=aK2VssgW5OA-w1rh26=3Ac1okg@mail.gmail.com>
References: <1349531633-26717-1-git-send-email-francois.perrad@gadz.org>
 <1349531633-26717-2-git-send-email-francois.perrad@gadz.org>
 <20121008113433.4b4bcc1b@skate>
 <CAB0FRss5vs6xDU2ggQAZYo7Tff5JSBMw519ta-x-4FRE6hxefg@mail.gmail.com>
 <20121008134900.403178cf@skate>
 <CAB0FRsuzTXvxs-t=sVTws2u=aK2VssgW5OA-w1rh26=3Ac1okg@mail.gmail.com>
Message-ID: <20121008211325.3138bc79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 8 Oct 2012 18:56:09 +0200, Fran?ois Perrad wrote:

> a BR user could choose between 2 methods for installing Perl :
> - a full install supplied by the script `installperl` from the Perl tarball
> - a custom install which reproduce the behavior of the BR package of microperl,
> where the user explicitily defines each module/file to install
> 
> In my sense, when a user chooses the full install, he must also use
> the post-build script which removes its useless files,
> like CORE/*.h or the Unicode support.

This is in complete contradiction with what we do in all other
Buildroot packages, so I don't think your statement actually makes
sense in the context of Buildroot. Unless BR2_HAVE_DEVFILES is enabled,
we don't want development files to be installed on the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
