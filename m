From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 21:14:55 +0200
Subject: [Buildroot] [PATCH 1/1] libgit2: New package.
In-Reply-To: <6324c3b1-c745-7375-9535-0c46abb61974@green-communications.fr>
References: <20180214111351.4801-1-nicolas.cavallari@green-communications.fr>
 <20180214111351.4801-2-nicolas.cavallari@green-communications.fr>
 <20180520222731.6757154c@windsurf>
 <6324c3b1-c745-7375-9535-0c46abb61974@green-communications.fr>
Message-ID: <20180522211455.1757a8b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 May 2018 19:19:52 +0200, Nicolas Cavallari wrote:

> > So, I've applied to next, but I had to change quite a few things that
> > were not really correct:
> >
> >      [Thomas:
> >       - Do not select BR2_PACKAGE_ZLIB, because zlib is an optional
> >         dependency.  
> IIRC zlib is not really an optional dependency.? If zlib is not 
> detected, then a bundled version of zlib is compiled in deps/zlib...
> 
> I don't think this is desirable, that's why i forced a dependency on zlib.

OK, then indeed we want zlib to be a dependency. The thing is that you
had a select BR2_PACKAGE_ZLIB, but zlib was not in <pkg>_DEPENDENCIES.

Don't hesitate to send a follow-up patch re-introducing zlib as a
mandatory dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
