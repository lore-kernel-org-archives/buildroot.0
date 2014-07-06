From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 06 Jul 2014 20:29:11 -0300
Subject: [Buildroot] [PATCH] lxc: disable lua and python
In-Reply-To: <87oax22rks.fsf@dell.be.48ers.dk>
References: <1404603241-20187-1-git-send-email-gustavo@zacarias.com.ar>
 <87oax22rks.fsf@dell.be.48ers.dk>
Message-ID: <53B9DBC7.10407@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/06/2014 04:52 PM, Peter Korsgaard wrote:

> Committed, thanks.
> 
> Any reason to not enable this support if lua/python is enabled?

Well, it breaks :)
Being an autotools package and sharing that with python infra is not
straightforward, it would require patching to not build/install the
python bits in the main build and doing so in separate steps with python
workarounds/love - it's probably better to just make it an option in the
python extensions menu as python-lxc.
And it didn't have that feature before, the bump being related to not
building on a gentoo distro/chroot, the autobuilders just didn't pick it
up because they're based on debian.
Regards.
