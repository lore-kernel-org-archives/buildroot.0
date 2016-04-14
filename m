From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Apr 2016 23:28:41 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <871t67j3g6.fsf@dell.be.48ers.dk>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be> <20160413234530.502a4244@free-electrons.com>
 <871t67j3g6.fsf@dell.be.48ers.dk>
Message-ID: <57100B89.2080106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/14/16 23:16, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>
>   > Hello,
>   > On Wed, 13 Apr 2016 23:32:22 +0200, Arnout Vandecappelle wrote:
>
>   >> Therefore, at least as a first step, I guess it's better to just move the
>   >> script to a common place, e.g. to package/genimage/post-image.sh. Let it take a
>   >> single argument for the genimage.cfg file, and add some documentation to the manual.
>
>   > As an after-thought, this seems like a good idea. This is really a very
>   > simple and minimal change, and is easy to do.
>
> The only complication is that you cannot directly pass arguments to
> post-image scripts, you have to use BR2_ROOTFS_POST_SCRIPT_ARGS (and it
> gets used for all scripts).

  I really don't think that this is a limitation. Especially if you don't pass 
the file, but the directory as the argument; that would be potentially useful 
for other post-image scripts as well.

  So I tend to prefer the simple common-script-in-package/genimage solution.


  That said, if Ezequiel posts a patch that takes into account all my concerns, 
I'll be happy to Ack it.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
