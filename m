From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Jan 2019 21:59:53 +0100
Subject: [Buildroot] [PATCH 08/11] support/download: implement
 source-check in git backend
In-Reply-To: <20190103204026.23512-9-patrickdepinguin@gmail.com>
References: <20190103204026.23512-1-patrickdepinguin@gmail.com>
 <20190103204026.23512-9-patrickdepinguin@gmail.com>
Message-ID: <20190103215953.012ee1a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu,  3 Jan 2019 21:40:23 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The implementation is the same as originally was present.
> It suffers from the disadvantage that an invalid revision on a valid URL
> will not be detected.
> 
> However, git does not seem to allow a good way to remotely check the
> validity of a revision, without cloning the repository.
> 
> For source-check, we don't want to do such download which can be large.

While I understand the limitation, I don't really agree with the
conclusion: we should go ahead and download the full thing. Indeed the
selling argument for source-check in your cover letter is precisely to
verify that the version of the package that has been committed by
someone is *really* available. If there's no version check in the git,
bzr and cvs source-check implementation, it makes the selling point of
the cover letter a bit moot, no?

Of course, I realize that your primary interest is in hg, and hg has
this capability. But still we should ensure git/bzr/cvs provide the same
guarantees, by falling back to the slower but working method of
downloading everything.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
