From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 07 Apr 2013 15:58:00 +0200
Subject: [Buildroot] [PATCH] post-build: reimplement using a for loop
 and make verbose
In-Reply-To: <20130403103226.36c1e0be@skate>
References: <1364977729-27519-1-git-send-email-luca@lucaceresoli.net>
 <20130403103226.36c1e0be@skate>
Message-ID: <51617B68.9030706@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Wed,  3 Apr 2013 10:28:48 +0200, Luca Ceresoli wrote:
>> Make the post-build system similar to the rootfs overlay system. This allows to
>> show each script filename before execution.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> I don't have a strong opinion on whether this is useful or not, but if
> it gets applied, I'd like the same to be done for post-image scripts,
> in order to keep the consistency.

To me it is useful each time multiple post-build scripts are used, 
because is
makes it easy to understand what's happening and which scripts you are 
running
(and which you are not running).
E.g., I have multiple products with a common base, plus some "optional" 
features.
Some features needs a specific post-build script. Each product 
implements a subset
of the features, but these subsets overlap between different products.
When a build a product's rootfs it is useful to see if I am running all 
and only
the correct post-build scripts: the "common base" script, plus the 
scripts for the
wanted features.

Of course I agree this change should be done also in the post-image scripts.
I will submit a patchset that does also this.

Luca
