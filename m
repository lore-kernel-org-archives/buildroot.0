From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Wed, 13 Jul 2016 13:38:17 +0000
Subject: [Buildroot] buildroot autobuild we access
Message-ID: <1468417097.19768.49.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter and Thomas,

Sometimes I use your web page with autobuild buildroot results:
http://autobuild.buildroot.net/

And I found the following behavior:?
When I want to view results limited to the ARC architecture, I click at "arc" link in the "Arch" column. After that I get to a page with
results for ARC.?

But when I want to get older results (click at "Next results" at the bottom of the web page) I get a page with next 50 results for all
architectures, not only for ARC.

I looked at the browser's address bar and found the following:
	1) When I click at "arc" a GET request with parameter "arch=arc" is sent,
	2) Then I click at "Next results" request with "start=50" is sent, but "arch=arc" parameter gets missed.?
? ? ? ? ? ?So I get results for all architectures.

Thereafter?if I want to get results from 50 to 100 and older for ARC I have to edit the address bar myself to send GET request with
"arch=arc&start=50" parameters.

I think it isn't very convenient that when we click at "Next results" while viewing a page for specific arch we are getting results for all
archs. As for me we should get next 50 results for that specific arch.

To fix it we just have not to lose "arch" parameter when clicking at "Next results" link.

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
