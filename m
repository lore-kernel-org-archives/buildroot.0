From: Adam Hawes <adam@infocab.com.au>
Date: Fri, 28 Sep 2007 16:05:42 +0930
Subject: [Buildroot] Cant get mplayer to build on x86 unless CFLAGS
	has	-fomit-frame-pointer
In-Reply-To: <183560612499095@lycos-europe.com>
References: <183560612499095@lycos-europe.com>
Message-ID: <1190961342.22869.122.camel@cyclops.infocab.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Has anyone had success getting mplayer to build on an x86. I had to
>  modify the .mk file to include -fomit-frame-pointer in the CFLAGS.
> 
> CFLAGS="$(TARGET_CFLAGS) -fomit-frame-pointer" \
> 
> Is this required because of something else going on with uclibc I can look into?
> Is there a better way to include this CFLAG?

This just arrived at my inbox but it's dated 23/9; you might try
checking your clock :)

Ulf (I think) submitted a patch to do this already; you must be using an
older revision of buildroot.  Search the mailing list.  It's nothing to
do with uClibc - it was something in uClibc.  There is a lengthy
discussion of it.

> Would it interfere with other builds and make them break?

Omitting the frame pointer makes debugging nigh-on impossible.

> Buildroot is a great product, well impressed, keep up the good work! :)



A
