From: Benjamin Kamath <kamath.ben@gmail.com>
Date: Wed, 17 Aug 2016 14:06:24 -0700
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
	archive
In-Reply-To: <20160817223928.08eeb43a@free-electrons.com>
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
 <20160817223928.08eeb43a@free-electrons.com>
Message-ID: <CAJsd3zKcE8vRDN6O-gr6QhJfffa2zg4SUxb8zLpP6HV7c2uAPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 17, 2016 at 1:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
>
> Are the tarballs produced using this method reproducible? We need the
> tarballs produced here to be reproducible so that we can store hashes
> for them in the package .hash file.
>

I've investigated this a little bit, and it does seem to create
reproducible tarballs. In my testing, the archive's produced via git
archive --remote=... actually match checksums with those produced via
shallow clone, delete .git, tar + gzip. I'd possibly need to
investigate the git source a bit more.
