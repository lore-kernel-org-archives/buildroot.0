From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Thu, 08 Mar 2007 14:23:09 +0200
Subject: [Buildroot] target busybox skeleton.
In-Reply-To: <20070308114948.GE31261@aon.at>
References: <20070218173211.GA31717@zelow.no> <20070308103626.GB31261@aon.at>
	<45EFF020.2020406@cs.helsinki.fi> <20070308114948.GE31261@aon.at>
Message-ID: <45F0002D.7020203@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer kirjoitti:
> On Thu, Mar 08, 2007 at 01:14:40PM +0200, Heikki Lindholm wrote:
> 
>>Bernhard Fischer kirjoitti:
>>
>>>On Sun, Feb 18, 2007 at 06:32:11PM +0100, Thomas Lundquist wrote:
>>>
>>>
>>>>Maybe it's a bit too tiny?
>>>>
>>>>I'd suggest that /usr/lib is added.
>>>
>>>
>>>hmz. And what if i don't have anything in /usr/lib? Wasted dentry.
>>>
>>>What about switching to "install -D" instead, where appropriate?
>>
>>If doing major changes, please consider taking portability issues into 
>>account. In this case, "-D" isn't supported on OS X.
> 
> 
> It shouldn't be too hard to ship our own working install source an
> compile and use that for the host, but thanks for the hint anyway.
> 
> MacOS-BSD already has trouble due to the use of "cp -a", IIRC and i was
> gradually switching those over to cp -dpf like suggested in one
> bug-report.

Getting a bit off-topic here maybe, but I have to comment that your 
effort has not been that useful, because such bug report has been wrong: 
Mac OS X doesn't support the -d option for cp and thus every cp -dfp is 
as dysfunctional as cp -a. Proper way would be cp -RPfp, which, as an 
unavoidable side-effect, is also recursive. I also filed a bug report on 
this a while ago.

-- Heikki Lindholm
