From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 28 Mar 2015 13:01:56 -0300
Subject: [Buildroot] [PATCH 4/4] package/powertop: Fix download problems
In-Reply-To: <20150328161554.36e131b8@free-electrons.com>
References: <1427543281-11901-1-git-send-email-bernd.kuhls@t-online.de>
 <1427543281-11901-4-git-send-email-bernd.kuhls@t-online.de>
 <20150328161554.36e131b8@free-electrons.com>
Message-ID: <5516D074.2030907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/28/2015 12:15 PM, Thomas Petazzoni wrote:

> This cannot work, because <pkg>_DEPENDENCIES are only guaranteed to be
> built and installed before the configure step of <pkg>. And here, you
> need host-wget before powertop gets downloaded.
> 
> So another solution is needed. Not sure which one, though.

Hi.
wget --no-check-certificate looks like the best solution, and rely on
our hashes for authentication/consistency.
Regards.
