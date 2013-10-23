From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Oct 2013 11:39:44 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
Message-ID: <20131023113944.2e370a3b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 22 Oct 2013 16:57:31 +0200, Thomas De Schampheleire wrote:

> Maybe the legal-info target should warn for non-existing files, rather
> than error out.

I disagree. Before 376c3aad61dbeb8e2126e13658fd150b70746afb
("legal-info: fail trying to copy a non-existent license file"), what
was happening is exactly what you're suggesting.

The problem is that we didn't notice when legal information were wrong,
because nobody looks at warnings, and because autobuilders result were
saying "OK" even though the legal info wasn't ok. So at the time (back
in May this year), we discussed that, and we agreed that legal-info
should error out if it cannot find a license file referenced by
<pkg>_LICENSE_FILES, so that autobuilder results loudly say that
something failed.

And interestingly, the precise reason why we noticed the legal-info
were wrong was because the autobuilder build failed, and we fixed it. I
very much prefer that than having the <pkg>_LICENSE_FILES remain wrong
for many weeks/months without anybody noticing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
