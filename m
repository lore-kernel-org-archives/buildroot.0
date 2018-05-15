From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 May 2018 17:14:52 +0200
Subject: [Buildroot] [PATCH 1/1] snort: fix build on sparc v8
In-Reply-To: <CAPi7W82SzgTdc+i20=pDWhgJA7qqTrrUu16BnEFeqONckzZ+vA@mail.gmail.com>
References: <20180510111748.26293-1-fontaine.fabrice@gmail.com>
 <20180513214550.529cba8c@windsurf.home>
 <CANu7NGtFKmJdQoT_-ecuUyG3Apctxm-6u7kjiYPeHOqkbk-L2w@mail.gmail.com>
 <20180515144128.602fea19@windsurf>
 <CAPi7W82SzgTdc+i20=pDWhgJA7qqTrrUu16BnEFeqONckzZ+vA@mail.gmail.com>
Message-ID: <20180515171452.78b8d170@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 May 2018 16:59:41 +0200, Fabrice Fontaine wrote:

> > OK, that explains the Git-formatted patches, without any obvious
> > upstream Git repository available online.
>
> So, do you want to reformat my patch? What is the best practice, should we
> always send git formatted patch even if there is no official Git
> repository?

The only clear policy that I'm trying to enforce is "if the project
uses Git as its version control system, then we want Git-formatted
patches". If on the other hand the projects is not using Git, then we
don't have a clear policy, and so far we have been accepting patches
that are not Git-formatted in such a case.

The snort situation caught my eye because your patch was not
Git-formatted, but the existing patches were.

> > OK, too bad. Is snort unmaintained ? Is upstream focused on this snort3
> > project ?
> >  
> Actually snort is most widely used than snort3. snort3 is still in alpha. I
> have a patch for snort3 package but snort and snort3 don't use the same
> version of daq library :-/

We could have a separate snort3 package, and a separate package for the
daq library as well. If the daq libraries are API incompatible, it
makes sense to have two separate packages for them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
