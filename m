From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 17 Dec 2014 10:07:11 -0300
Subject: [Buildroot] [PATCH] freetype: add some dependencies
In-Reply-To: <548CD4D7.1090808@ou.edu>
References: <548CD4D7.1090808@ou.edu>
Message-ID: <54917FFF.1060101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/13/2014 09:07 PM, Steve Kenton wrote:

> freetype needs fenv.h which is not available on uClibc except for x86, add dependencies
> 
> Signed-off-by Stephen M. Kenton <skenton@ou.edu>

Hi.
This is wrong.
I'm using freetype with rrdtool for ARM and PowerPC targets with uClibc
just fine.
In fact any search for fenv.h in the freetype source gives nothing.
And the autobuilders would have caught this by now.
Is it possible that some other application that links to freetype is
breaking, and uses fenv itself?
Regards.
