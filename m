From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 3 Mar 2016 10:56:37 -0300
Subject: [Buildroot] Analysis of build results for 2016-02-21
In-Reply-To: <20160222150539.0301105e@free-electrons.com>
References: <20160222073022.D29851025E8@stock.ovh.net>
 <20160222150539.0301105e@free-electrons.com>
Message-ID: <56D84295.6050003@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/02/16 11:05, Thomas Petazzoni wrote:

>>      mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/64cd09dc957cbeaab9c5c6d331d38e6e22da29ae/
>
> prototypes.h:625:5: error: conflicting types for 'getnameinfo'
>   int getnameinfo(const struct sockaddr *, socklen_t,
>
> Interestingly, this problem seems to occur only on MIPS. Vicente,
> Gustavo, any idea?

Hi.
I defer to Vicente on this one, seems to be a toolchain issue since all 
of the failures are mips(32/64)r6 little-endian with external toolchain 
(codescape), switching to r2 yields good builds.
Regards.
