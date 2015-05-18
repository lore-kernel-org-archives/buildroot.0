From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 21:53:50 +0200
Subject: [Buildroot] [PATCH v2 1/2] libsodium: new package
In-Reply-To: <CA+-urNRu=qpsQ_-O_y16-MVoYw-Vxqwc1myZw3mTqV=3aSDiOg@mail.gmail.com>
References: <1431955144-31785-1-git-send-email-fhunleth@troodon-software.com>
 <20150518153137.GM2845@tarshish>
 <CA+-urNRu=qpsQ_-O_y16-MVoYw-Vxqwc1myZw3mTqV=3aSDiOg@mail.gmail.com>
Message-ID: <20150518215350.50ff6ca5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Mon, 18 May 2015 12:07:24 -0400, Frank Hunleth wrote:

> As I said in a previous email, I use the host package and asked for
> guidance for including host packages or not. I didn't see a response.
> While I certainly don't mind removing it, it would be nice to know why
> host packages are such a problem. For me, it is very convenient that
> Buildroot requires so little of the host Linux environment to work.
> Libsodium, in particular, is annoying since you can't apt-get install
> it in Ubuntu 12.04. I know that's old, but it's around. Anyway, that's
> my 2 cents. It will be gone for v3...

The thing is that we generally don't like to have "dangling" packages,
that are not used by anything in Buildroot.

Normally, host packages fall into one of the two following categories:

 * Used as a dependency to build a target package. In this case, the
   host package is listed as host-<foo> in the <pkg>_DEPENDENCIES of
   another package. So it is actually used by something in Buildroot.

 * Used as a tool (for flashing, creating images, debugging, etc.) and
   in this case, it's listed in the "Host utilities" menu in
   menuconfig. In this case, it is directly visible to the user.

But what you propose here does not fall into any of these two cases. We
don't put host libraries in the "Host utilities" menu, and your host
package is not used by any other package in Buildroot, hence Baruch's
reaction.

I think we may have made a couple of exceptions in the past, but I'm
not sure how many. And they still have the major drawback that such
packages will never be tested, because they cannot be reached by
autobuilder testing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
