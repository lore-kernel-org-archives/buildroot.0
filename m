From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 09:09:34 +0200
Subject: [Buildroot] [PATCH] support/scripts/cve.py: use fast ijson
 backend if available on old ijson versions
In-Reply-To: <20210409110112.20087-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Apr 2021 13:01:12 +0200")
References: <20210409110112.20087-1-peter@korsgaard.com>
Message-ID: <87pmyho72p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > ijson < 2.5 (as available in Debian 10) use the slow python backend by
 > default instead of the most efficient one available like modern ijson
 > versions, significantly slowing down cve checking. E.G.:

 > time ./support/scripts/pkg-stats --nvd-path ~/.nvd -p avahi --html foobar.html

 > Goes from
 > 174,44s user 2,11s system 99% cpu 2:58,04 total

 > To
 > 93,53s user 2,00s system 98% cpu 1:36,65 total

 > E.G. almost 2x as fast.

 > As a workaround, detect when the python backend is used and try to use a
 > more efficient one instead.  Use the yajl2_cffi backend as recommended by
 > upstream, as it is most likely to work, and print a warning (and continue)
 > if we fail to load it.

 > The detection is slightly complicated by the fact that ijson.backends used
 > to be a reference to a backend module, but is nowadays a string (without the
 > ijson.backends prefix).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
