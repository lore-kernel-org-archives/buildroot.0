From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jul 2014 10:12:31 -0300
Subject: [Buildroot] Replace libev with libuv
In-Reply-To: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
References: <CALoSW641XSGs6H4i_q07ZfxUtRYoUMgdxBaUtus5J5C7+K=0Fw@mail.gmail.com>
Message-ID: <53C91D3F.4060500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/18/2014 09:48 AM, Nimai Mahajan wrote:

> libuv supercedes libev in many ways, adds more features, and is
> regularly updated. libev has not been updated for more than a year
> now. libuv uses autogen.sh which is tricky to get working properly in
> Buildroot so I request the higher authorities to add this as it is
> perhaps the most useful asynchronous I/O library in C. Current
> unstable version is 0.11.26 and stable is 0.10.27. Thank you.

Hi.
I don't have any authority badge ;) but libev and libuv even though they
provide basically the same functionality have different APIs, hence once
doesn't replace the other, specially since libev is used by some
packages which probably won't work with libuv without some serious
retooling.
autogen.sh isn't that tricky, normally enabling autoreconfiguration via
PKGNAME_AUTORECONF = YES suffices to get that out of your way, as stated
in the manual (adding packages autotools).
Give that a try.
Regards.
