From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:16:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/sconeserver: disable image
In-Reply-To: <5c432d3e-e72a-0835-a090-7991a03eb357@mind.be> (Arnout
 Vandecappelle's message of "Mon, 26 Apr 2021 22:05:04 +0200")
References: <20210321114712.1072879-1-fontaine.fabrice@gmail.com>
 <5c432d3e-e72a-0835-a090-7991a03eb357@mind.be>
Message-ID: <87h7jseogc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 21/03/2021 12:47, Fabrice Fontaine wrote:
 >> Build of http::sconesite::image module was silently broken until commit
 >> d3b818c3cf0990117a8b59fcfc6c212f310ae6ec
 >> 
 >> However, sconeserver fails to build with ImageMagick because:
 >> - it checks for ImageMagick++.pc instead of ImageMagick.pc
 >> - it uses the transform function which has been removed from the public
 >> API since version 7.0.1-0 and
 >> https://github.com/ImageMagick/ImageMagick/commit/06f590165f0505d42005264893fe14a9e8a79986
 >> 
 >> As sconeserver does not seem to be maintained anymore, drop
 >> BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE and don't had a
 >> Config.in.legacy entry because the option was silently broken since a
 >> long time

 >  I did add a legacy entry after all. It costs us exactly nothing, and if someone
 > actually had that selected, they know what's going on. I'm a bit sensitive about
 > legacy handling :-)

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
