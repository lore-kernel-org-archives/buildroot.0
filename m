From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:32:01 +0200
Subject: [Buildroot] [PATCH 1/1] boost: detect missing selects
In-Reply-To: <20180707124940.15961-1-fontaine.fabrice@gmail.com>
References: <20180707124940.15961-1-fontaine.fabrice@gmail.com>
Message-ID: <2fa7c4b0-81c5-9ca8-5d69-d619dd59c097@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-07-18 14:49, Fabrice Fontaine wrote:
> As suggested by Arnout during the review of
> http://patchwork.ozlabs.org/patch/934589, add a mechanism to detect a
> missing boost select by checking that we do not install a boost library
> which hasn't been selected by the user.
> 
> To manage a change of boost configuration by the user between two
> builds, add a BOOST_PRE_INSTALL_TARGET_HOOKS to remove all boost
> libraries before installing them.
> 
> Also, use ls with a wildcard instead of test to avoid trying to guess
> library names if boost layout is set to tagged or versionned (the
> wildcard will also help us to manage shared or static library)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
