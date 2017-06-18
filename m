From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 15:55:12 +0200
Subject: [Buildroot] Updates on http://autobuild.buildroot.net/ broken?
In-Reply-To: <jc2g1exqk8.ln2@ID-313208.user.individual.net>
References: <jc2g1exqk8.ln2@ID-313208.user.individual.net>
Message-ID: <20170618155512.026451aa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Jun 2017 18:36:03 +0200, Bernd Kuhls wrote:

> the last reported build dates back to 0:54 am today, is there something 
> broken w.r.t. updating the results?

Thanks for reporting the issue. The problem was that the root
filesystem was full, in terms of number of inodes, due to lighttpd
mod_compress cache having filled in the entire filesystem with a large
number of small files. This was preventing the upload of new results.

I've fixed that up, and results have started accumulating again. Build
results for Sunday (posted on Monday morning European time) should be
back to normal.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
