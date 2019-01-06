From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Jan 2019 21:01:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/php_zmq: fix build with php
 7.3.0
In-Reply-To: <20190104044716.34134-1-fhunleth@troodon-software.com> (Frank
 Hunleth's message of "Thu, 3 Jan 2019 23:47:16 -0500")
References: <20190104044716.34134-1-fhunleth@troodon-software.com>
Message-ID: <87o98tftds.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > This includes an patch that fixes the following error:
 > ```
 > /home/buildroot/build/instance-0/output/build/php-zmq-1.1.3/zmq.c: In function 'php_zmq_context_get':
 > /home/buildroot/build/instance-0/output/build/php-zmq-1.1.3/zmq.c:238:20: error: lvalue required as left operand of assignment
 >    GC_REFCOUNT(&le) = 1;
 >                     ^
 > /home/buildroot/build/instance-0/output/build/php-zmq-1.1.3/zmq.c: In function 'php_zmq_socket_store':
 > /home/buildroot/build/instance-0/output/build/php-zmq-1.1.3/zmq.c:538:19: error: lvalue required as left operand of assignment
 >   GC_REFCOUNT(&le) = 1;
 > ```

 > The patch was created from the PR at:

 > https://github.com/mkoppanen/php-zmq/pull/195

 > Upstream has not merged the PR. Fixes:

 > http://autobuild.buildroot.org/results/3f2/3f258fbc7352c3d7205bc6402145be1102d69683

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
