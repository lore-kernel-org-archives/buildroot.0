From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 13:58:48 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <CAOJ2eMeC_-w7syzaYMYnBa95y8PkV+yJtjJ6aOdNCg_ZPASLcA@mail.gmail.com>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
 <20180612210124.18e1f168@windsurf>
 <fb74bf87-dfdf-5dc6-8612-9faa896ae6e4@mind.be>
 <20180613115705.43c5b5b3@windsurf>
 <CAOJ2eMeC_-w7syzaYMYnBa95y8PkV+yJtjJ6aOdNCg_ZPASLcA@mail.gmail.com>
Message-ID: <20180613135848.1fcd56bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jun 2018 13:03:45 +0300, Stefan Becker wrote:

> On Wed, Jun 13, 2018 at 12:57 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > However, generally speaking, I do agree that we tend to push back on
> > people proposing to add more complexity to Buildroot, for the reasons
> > I've highlighted before.  
> 
> Wouldn't it then be much simpler to reject this change, i.e. *not*
> adding tarball generation to buildroot SW build at all?

That's one option. Another option is to:

 (1) Use another make target, such as sdk-tarball, as you suggested

 (2) Use a stable name for the output, like
     output/images/buildroot-sdk.tar.gz. Indeed for no other Buildroot
     output we include the Git commit ID or the target tuple in the
     name of the file being generated.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
