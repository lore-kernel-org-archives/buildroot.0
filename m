From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 23:31:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] taskd: new package
In-Reply-To: <1457577520-11211-1-git-send-email-mathstuf@gmail.com>
References: <1445204187-8157-1-git-send-email-mathstuf@gmail.com>
 <1457577520-11211-1-git-send-email-mathstuf@gmail.com>
Message-ID: <20160310233141.4fa3065f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben,

On Wed,  9 Mar 2016 21:38:40 -0500, Ben Boeckel wrote:
> Taskwarrior is a task management suite of tools. Taskd is the
> synchronization server for it.
> 
> Signed-off-by: Ben Boeckel <mathstuf@gmail.com>

Thanks for this updated version! I've applied, but there were still a
few things to fix. Here are the changes I did:

    [Thomas:
     - use 'depends on' for BR2_USE_MMU, and add a comment indicating that
       the dependency is due to the use of fork()
     - use 'depends on' for BR2_USE_WCHAR, and add a comment indicating
       that the dependency is due to gnutls and util-linux.
     - add a hash file.]

Also, it would be a good idea to send a new patch that adds a simple
init script to start this server at boot time. This way, taskd can work
"out of the box".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
