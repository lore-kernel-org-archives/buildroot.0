From: Dan Raymond <draymond@foxvalley.net>
Date: Tue, 2 Mar 2021 08:43:35 -0700
Subject: [Buildroot] environment variables with spaces (request for comments)
In-Reply-To: <20210302123333.755928-1-yann.morin.1998@free.fr>
References: <20210302123333.755928-1-yann.morin.1998@free.fr>
Message-ID: <d29457bd-026e-6c02-8da3-7385e80d7fcf@foxvalley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I encountered a bug in Buildroot that resulted in a failure to run 'make 
linux-menuconfig'.? I tracked down the problem to a bug in 
package/pkg-kconfig.mk that was attempting to remove a set of variables 
from an environment string.? The problem is that a naive technique was 
being used that did not account for quoted variables that contained 
embedded spaces.? To be clear, 'make menuconfig' from the linux kernel 
tree works fine: this bug is in Buildroot only.? The reason I discovered 
this bug (and others may not) is because my PATH environment variable 
contains embedded spaces (which may be uncommon but valid and sometimes 
necessary).

I implemented/tested/submitted a patch that reliably fixes the bug.

Yann MORIN objected to my patch because he believes some of the packages 
Buildroot supports contain similar bugs.? I responded to his objection 
but he ignored my response and submitted his own patch that undermines 
mine by intentionally causing ALL make targets to fail when the PATH 
environment variable contains embedded spaces.? I don't think that 
starting a "patch war" is productive or contributes to the goals of the 
Buildroot community.? Can we have a discussion instead and come to a 
consensus on this matter?
