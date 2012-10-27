From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Oct 2012 19:52:45 -0300
Subject: [Buildroot] [PATCHv2] gnutls: fix link-time build failures
In-Reply-To: <87ehkjk3wn.fsf@macbook.be.48ers.dk>
References: <1351117215-4614-1-git-send-email-gustavo@zacarias.com.ar>
 <87ehkjk3wn.fsf@macbook.be.48ers.dk>
Message-ID: <508C65BD.6080107@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/27/12 18:20, Peter Korsgaard wrote:

> It's a bit odd that you need both the variable and the configure
> options, but OK - You presumably do.
> 
> Committed, thanks.

--disable-rpath surely isn't enough, we've tested it with Thomas.
Looking at the complete source they're each referenced in different
inclusive and exclusive parts so i'd rather stay on the safe side with both.
I didn't test with just the configure env variable but looking at
configure they're both doing their separate assignments and i think we
don't want this to rear it's ugly head again :)
Regards.
