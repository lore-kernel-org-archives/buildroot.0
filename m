From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 21:43:44 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
 <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
Message-ID: <20170206214344.3bfd403d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Feb 2017 21:40:58 +0100, Luca Ceresoli wrote:

> Splitting the source step from the build step is nice since it clearly
> separated download-related issues (wrong URL, network down...) from
> build errors.
> 
> But as discussed IRL it also means we download the ACTUAL_SOURCE files,
> which means hundreds of megabytes with external toolchains. Possible
> solutions:
> 
>  * remove the "make source" step and let "make ${pkg}" download only the
>    sources that are really needed for building
>  * remove the "make source" step as above, but only if ${pkg} is empty
>  * add a "source-only-filed-needed-for-build" :) target and use that

I don't really see the need for separating the build step from the
source step in this script. Why not just do the build, and that's it?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
