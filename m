From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 22:59:52 +0200
Subject: [Buildroot] [PATCH] protobuf: fix circular dependency warning
In-Reply-To: <1342212552-6567-1-git-send-email-spdawson@gmail.com>
References: <1342212552-6567-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120713225952.67925f4e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Jul 2012 21:49:12 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> The protobuf package depends on host-protobuf, which leads to a
> circular dependency of host-protobuf on host-protobuf. The following
> warning is output.
> 
>   make: Circular host-protobuf-depends <- host-protobuf dependency dropped.
> 
> This patch breaks the circular dependency, by explictly asserting the
> dependencies of host-protobuf (currently none).
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

I think
http://lists.busybox.net/pipermail/buildroot/2012-July/055442.html
solves that problem in a much more generic way. Could you test this
patch and report if it solves the problem for you?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
