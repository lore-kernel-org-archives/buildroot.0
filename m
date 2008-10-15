From: hartleys <hartleys@visionengravers.com>
Date: Wed, 15 Oct 2008 14:43:39 -0400
Subject: [Buildroot] packages and architecture specific include files
In-Reply-To: <014301c92ef4$75909f80$6901a8c0@iguana3>
References: <014301c92ef4$75909f80$6901a8c0@iguana3>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909AEF664@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, October 15, 2008 11:33 AM, John Schimandle wrote:
> #include <asm/arch/gpio.h>

That file is a kernel header. It shouldn't be included in userspace
code.

As an example, all the inline functions will and extern function
prototypes will not work and generate build errors if you try and use
them. Also, the other #include statements in the file are going to break
if you try to include the file.

Your probably better off just working out what you need from the file
and creating a local "API" header for your application.

Hartley
