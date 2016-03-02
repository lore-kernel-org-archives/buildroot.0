From: Jeroen Roovers <jer@airfi.aero>
Date: Wed, 2 Mar 2016 15:24:29 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-03-01
In-Reply-To: <20160302073023.58B81101BA9@stock.ovh.net>
References: <20160302073023.58B81101BA9@stock.ovh.net>
Message-ID: <CANCHnQros_GrNhEnk74UG6Q8NiwO9ZvmELezDrMjwzwwv4dCzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am curious about nginx in particular since I found a bug in its
magnificent configuration system today (which I didn't exactly fix but
worked around).

Using GCC 4.9.3 I found last year that nginx compiled fine but dropped
the response header returned by its proxies. I didn't know back then
that nginx was to blame, but that's beside the matter.
The gist is that it returned the remainder of the headers to the HTTP client.

On 2 March 2016 at 08:30, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>        sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/9dc9e7d85a618e5e6fd9b892ba591fc95edd413a/

I checked the log and indeed it correctly says:

checking for system byte ordering ... big endian

Note that this is a compile test on the host, which is a punishable
offense in forward-thinking nations.

I see the same message compiling on an amd64 host for an ARM target.

I worked around it by neatly forcing -DNGX_HAVE_LITTLE_ENDIAN.

This is probably something that nginx developers should fix (perhaps
by using a standardised configuration system?) but why I turn to the
list is to ask if the autobuild logs return "big endian" for all
platforms, and to suggest that perhaps this should be flagged somehow.

Kind regards,
     jer
