From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 3 Nov 2014 10:29:27 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
In-Reply-To: <CA+TH9VmVC8N2-k_mUvf8b_gtMyXk+cgw0Wv+2Z0sM=+1SdVfRQ@mail.gmail.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141101144354.66e2e698@free-electrons.com>
 <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
 <20141102225411.0fe3d3de@free-electrons.com>
 <CA+TH9VmVC8N2-k_mUvf8b_gtMyXk+cgw0Wv+2Z0sM=+1SdVfRQ@mail.gmail.com>
Message-ID: <CA+TH9Vm2PPd7WaTdtK0u_PF=sxhtFn=ztqMrtedT4z_mFXMPzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas
>
> Our site is small, and do only have tens of elements, so I admit that
> could be a good idea rewriting only parts in which we are interested.

Unfortunately, this approach doesn't work. Changing the colour scheme
is really difficult cause we should overwrite in so many places that
it will be impossible to not make a mistake.

This is also the reason for the really massive number of bootstrap
theme generator out there. The only viable approach is to use a theme
from bootswatch:

http://bootswatch.com/cerulean/bootstrap.css (the same theme previously used)

Change the font in bootswatch.less than recompile the css blob. I
usually have a post commit hook that recompile bootstrap automatically
in case of changes on my websites, in this case I can afford to keep
in sync manually also for the future.

So if you like this way, I'll update variables.less and
bootswatch.less to bootstrap 3.2, then I'll recompile bootstrap, then
I'll send you a zip with new files to overcome smtp problems with very
long lines.

What do you think?

Hope this help!
