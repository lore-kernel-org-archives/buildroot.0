From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 17:19:56 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <20181119114806.4fb9d98b@windsurf.home>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
 <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
 <20181116144735.19585727@windsurf>
 <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
 <20181116195741.GV10271@scaer>
 <10c54101-3264-eefb-58d0-4770ef723717@mind.be>
 <20181119114806.4fb9d98b@windsurf.home>
Message-ID: <20181120171956.21fb03bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Nov 2018 11:48:06 +0100, Thomas Petazzoni wrote:

>  3. Patch step
>     Prepare PPD with patch dependencies

In fact no: this is *not* needed. Patch dependencies are special:

$$($(2)_TARGET_PATCH):  | $$(patsubst %,%-patch,$$($(2)_FINAL_PATCH_DEPENDENCIES))

Contrary to other dependencies where we depend on the "dependent"
package to be fully built and installed, a patch dependency is a
dependency between the patch step of package A, and the patch step of
package B.

Since we only depend on the patch step of the "dependent" package to be
completed, and that up the patch step, packages are not allowed to
install stuff to $(HOST_DIR), $(TARGET_DIR) or $(STAGING_DIR), there is
nothing to do in terms of per-package folder preparation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
