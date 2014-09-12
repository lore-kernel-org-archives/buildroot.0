From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Fri, 12 Sep 2014 09:45:26 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140912101105.1e932cb8@free-electrons.com>
References: <20140912063012.AF99B100DEE@stock.ovh.net>
 <20140912101105.1e932cb8@free-electrons.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356D2009A@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> 
> >        arc |                  libpfm4-4.3.0 | NOK |
> http://autobuild.buildroot.net/results/405da9a945511329929b18740b983c51
> b8dcc43e/
> 
> Stupid warning beind treated as an error:
> 
> task.c: In function 'read_groups':
> task.c:110:5: error: format '%zd' expects argument of type 'signed size_t', but
> argument 4 has type 'ssize_t' [-Werror=format=]
>      evt, new_sz, ret);
>      ^
> cc1: all warnings being treated as errors
> 
> Anton, since the problem is seen on ARC, maybe you could have a look,
> fix the warning, and try to see if -Werror can be removed?
> 

This issue has been reported to our compiler engineers half a year ago. That
seems to be a bug in the type definitions in ARC GCC, because GCC expects
arguments of type "signed size_t", yet it doesn't even allows to declare a
variable of this type. I've just sent a reminder about this issue to the team.

As a workaround we can submit patch that will add -Wno-error=format to this
package. Is it ok?

Anton
