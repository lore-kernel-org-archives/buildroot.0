From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Sep 2015 00:14:56 +0200
Subject: [Buildroot] [PATCH] RFC: Adding Vagrant file for provisioning
In-Reply-To: <1441836107-17689-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1441836107-17689-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <55F0AF60.7030102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10-09-15 00:01, Angelo Compagnucci wrote:
> This patch adds a Vagrant file to buildroot. With this file
> you can provision a complete buildroot developing environment
> in minutes on all major platforms.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
> 
> This patch is a tentative approach to add a standard and official
> Vagrant file to buildroot. With this file you can setup an isolated
> build environment based on Vagrant on all major platforms.
> 
> The file is fairly basic right now, it sets up correct Ubuntu version
> to download and install required packages for buildroot.
> 
> I'm open to suggestions and critics!

 Here goes:

 If you're already on a platform that runs vagrant, then you have enough to run
buildroot as well, so why would you want to put it inside a VM and double your
build time? Buildroot really really tries very hard to make sure it runs in any
environment, so there should be no need for any of this trickery.

 The only limitation you do have is that you need some tools like a compiler and
some VCSes. If that is what you want to work around, then I'd prefer to go the
way of a single-user nix environment to import these tools.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
