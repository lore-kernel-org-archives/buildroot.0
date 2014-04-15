From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Apr 2014 13:22:08 -0300
Subject: [Buildroot] [PATCH] libcurl: drop polarssl support
In-Reply-To: <20140415181021.5ed849a7@skate>
References: <1397570346-25849-1-git-send-email-gustavo@zacarias.com.ar>
 <20140415181021.5ed849a7@skate>
Message-ID: <534D5CB0.3040301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/15/2014 01:10 PM, Thomas Petazzoni wrote:

> It seems odd to drop a feature because we have a too old version of a
> dependency, no? Shouldn't we package polarssl 1.3, even if as a
> separate polarssl13 package?

The problem is that they aren't made to live together in a friendly way
and some packages don't take path arguments for it.
It would require quite some package patching since we'd need each
polarssl to live outside the default include/library PATHs.
We aren't dropping a feature itself, just a feature based on one of the
possible candidates that enables it, with gnutls, nss and openssl being
the other candidates for the job.
The big culprit here AFAIK is just openvpn, it's the only mofo that
won't do with polarssl 1.3. There are patches in the master branch
upstream for it, but that's to become openvpn 2.4 or so.
Maybe they're not hard to backport, i don't know, but it would require
more testing than just "it builds".
Or we can kill polarssl support in openvpn, not great either since the
other alternative is openssl.
Regards.
