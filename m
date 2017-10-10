From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 10:35:40 +0200
Subject: [Buildroot] [PATCH 1/8] libselinux: bump to 2.7
In-Reply-To: <8f8f5547-b7f4-8172-4989-36a5d8767c16@mind.be>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
 <8f8f5547-b7f4-8172-4989-36a5d8767c16@mind.be>
Message-ID: <20171010103540.44ee4777@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Oct 2017 02:47:59 +0200, Arnout Vandecappelle wrote:

>  You update all the individual packages in separate patches, which is excellent
> for review. However, I wonder if it is really possible to update just one of
> them without updating the rest. Does libselinux-2.7 work with libsepol-2.7?
> 
>  If not, we should probably squash all patches into one single patch while
> applying. Thomas, Peter, do you agree?

I don't really have a strong opinion. I think it's sometimes hard to
achieve both full bisectability and fine-grained patches.

In the same vein, in your review of comment PATCH 5/8 on
policycoreutils, you rightfully tell Adam that the patch adding the new
restorecond should come *before* the bump of policycoreutils that drops
the built-in restorecond functionality. This is obviously correct, but
it means that there is a step where you have both the new restorecond
package and the old policycoreutils package, possibly stepping on each
other, or maybe even with restorecond not building (because it needs
the newer version of policycoreutils or something).

So, it's probably hard to have something that is both easy to review
(fine-grained patches) and bisectable (one big patch).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
