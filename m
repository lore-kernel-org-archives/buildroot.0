From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2016 15:52:37 +0200
Subject: [Buildroot] buildroot autobuild we access
In-Reply-To: <1468417097.19768.49.camel@synopsys.com>
References: <1468417097.19768.49.camel@synopsys.com>
Message-ID: <20160713155237.1797c8a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jul 2016 13:38:17 +0000, Vlad Zakharov wrote:

> Sometimes I use your web page with autobuild buildroot results:
> http://autobuild.buildroot.net/
> 
> And I found the following behavior:?
> When I want to view results limited to the ARC architecture, I click
> at "arc" link in the "Arch" column. After that I get to a page with
> results for ARC.?
> 
> But when I want to get older results (click at "Next results" at the
> bottom of the web page) I get a page with next 50 results for all
> architectures, not only for ARC.

Correct.

> I looked at the browser's address bar and found the following:
> 	1) When I click at "arc" a GET request with parameter
> "arch=arc" is sent, 2) Then I click at "Next results" request with
> "start=50" is sent, but "arch=arc" parameter gets missed. So I get
> results for all architectures.
> 
> Thereafter?if I want to get results from 50 to 100 and older for ARC
> I have to edit the address bar myself to send GET request with
> "arch=arc&start=50" parameters.
> 
> I think it isn't very convenient that when we click at "Next results"
> while viewing a page for specific arch we are getting results for all
> archs. As for me we should get next 50 results for that specific arch.
> 
> To fix it we just have not to lose "arch" parameter when clicking at
> "Next results" link.

This is just a limitation of the pile of PHP crap that I wrote to run
autobuild.buildroot.org. The code is at
http://git.buildroot.org/buildroot-test/ (of course, once the Git
repository will be back), so do not hesitate to send patches to improve
things. Be ready for a dive into a pile of horrible code if you start
looking at this PHP stuff.

Note that you can also use the magic "step" argument to get more than
50 results per-page (though it is limited to max 250 results per page
IIRC). So, you can do:

	http://autobuild.buildroot.net/?arch=arc&step=250&status=NOK

To get the latest 250 failures happening on ARC.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
