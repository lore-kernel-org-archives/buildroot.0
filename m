From: David Lambert <dave@lambsys.com>
Date: Wed, 18 Oct 2006 13:09:30 -0500
Subject: [Buildroot] nice() seems to have stopped working?
Message-ID: <45366DDA.9050504@lambsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since moving to this distribution, I notice that some of my programs 
that use nice() give errors when attempting to raise their priorities. 
In order to try and nail this down I wrote the following trivial program:

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int	main(int ac, char *av[])
{
   int n    printf("Trying nice(%d)\n", n);
   if (nice(n) < 0) {		/* Attempt to change priority */
     perror("Nice failed to change priority");
   }
   else {
     printf("Success\n");
   }
   return 0;
}


Running this program as root provides the following output:

/ # whoami
root
/ # niceTest 0
Trying nice(0)
Success
/ # niceTest 1
Trying nice(1)
Success
/ # niceTest -1
Trying nice(-1)
Nice failed to change priority: Success
/ #

Has anyone else experience this behavior?

Best regards,

Dave.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dave.vcf
Type: text/x-vcard
Size: 288 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061018/fd7b7bf5/attachment.vcf 
