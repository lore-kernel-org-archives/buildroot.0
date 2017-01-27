From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 20:32:11 +1300
Subject: [Buildroot] [V2 2/2] sngrep: fix error if gnutls and openssl
 are both enabled.
In-Reply-To: <20170126213931.9987-2-aduskett@codeblue.com>
References: <20170126213931.9987-1-aduskett@codeblue.com>
 <20170126213931.9987-2-aduskett@codeblue.com>
Message-ID: <20170127203211.071997cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 16:39:31 -0500, Adam Duskett wrote:
> With the changes applied by thomas I noticed that sngrep will now
> fail to configure if both openssl and gnutls are selected
> (both can't be enabled at the same time.)  I set openssl to take
> precidence over gnutls, mainly because it's the larger of the two
> dependencies, and if the user has selected it they probably want
> to use it.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

Applied, with the following changes:

    [Thomas:
     - regroup CONF_OPTS lines
     - add an 'else' clause to explicitly disable gnutls and openssl when
       none are available
     - add a reference to the autobuilder failure]

I've also made a separate commit to fix the libgcrypt issue, see:

  https://git.buildroot.org/buildroot/commit/?id=6205b75873cefe5376f49934f456729f5de6ee1f

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
