From: Dan Price <dp@dssd.com>
Date: Mon, 11 Mar 2013 12:15:24 -0700
Subject: [Buildroot] [PATCH V6] nodejs: new package
In-Reply-To: <20130310154409.02955623@skate>
References: <1362706276-11111-1-git-send-email-daniel.price@gmail.com>
 <20130310154409.02955623@skate>
Message-ID: <CAH+T41a5=hfc+CXY-AATKLPGL=6ZnW4SHSD9O8BE6k-mHbtbjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the ack!  To answer the interview question posed above, the
reason your example makefile is confusing you is the ' #"' trailing
comment.  This causes qstrip to evaluate to $(strip $(subst
",,$(1)))[SPACE], since trailing spaces are significant, so if you remove
the space and the comment, the makefile does what you'd expect.

      -dp


On Sun, Mar 10, 2013 at 7:44 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Daniel Price,
>
> On Thu,  7 Mar 2013 17:31:16 -0800, Daniel Price wrote:
> > Based off of patches posted by (and Signed-off-by:) Jonathan Liu <
> net147 at gmail.com>
> >
> > Signed-off-by: Daniel Price <daniel.price@gmail.com>
>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Daniel Price -- dp at dssd.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130311/d08e6bd2/attachment.html>
