From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jun 2014 13:00:25 +0200
Subject: [Buildroot] [ANNOUNCE] Autobuilder script available,
 join the autobuilder effort!
In-Reply-To: <CAAXf6LWy4ysqMhrQ=FMZszUoyYzd_711VfCCgSUTO_WwTQ8vbA@mail.gmail.com>
References: <20140614212341.5306ead8@free-electrons.com>
 <CAAXf6LWy4ysqMhrQ=FMZszUoyYzd_711VfCCgSUTO_WwTQ8vbA@mail.gmail.com>
Message-ID: <20140617130025.664a1df6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 17 Jun 2014 12:24:53 +0200, Thomas De Schampheleire wrote:

> First of all thanks a lot for making this available!

And thanks a lot to you for being apparently the first person to test
the script. Again, please be tolerant with my horrible Python skills
exposed throughout the script :)

> I am currently testing the script, and hope to get permission to run
> it during the night on one or more work machines.
> I had to make one modification currently: since we are behind a
> firewall, running 'git' directly is not possible, but I need to use a
> wrapper script. I added this:
> 
> +try:
> +    gitcmd = os.environ['GIT']
> +except KeyError:
> +    gitcmd = 'git'
> 
> at the top of the script, and replaced all direct occurrences of 'git'
> with gitcmd.
> This allows me to run 'GIT=git-wrapper autobuild-run'.
> 
> I used an environment variable because it seemed superfluous to add a
> configuration variable for it, but if you prefer I can do that too.

I don't have a very strong preference here. Perhaps having it defined
in the configuration file would be better, as it is more similar to
what we do for the other configuration parameters?

Do not hesitate to send me patches, the Git repository is at
git://git.busybox.net/buildroot-test.

> Is there an easy way to get a web interface like that on
> autobuild.buildroot.org, for the locally created builds? This would
> make it easy to inspect the results while testing (for example to see
> that some host package like 'bzr' needed to be installed, ...).

Well, the autobuild.buildroot.org interface is itself available in
git://git.busybox.net/buildroot-test. However, setting it up will
require a bit of configuration (PHP, MySQL + one database). You could
then submit your builds to your own autobuilder instance for testing,
and then decide to switch to the main autobuilder instance at
autobuild.buildroot.org once you believe things are stable enough.

Thanks again for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
