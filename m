From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 18:51:55 +0200
Subject: [Buildroot] [PATCH 1/1] package: remove the trailing slash sign
 from the URL address
In-Reply-To: <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
References: <1379517858-28720-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LU8GCW7vwVvoBrSeTaongix761F=DT1Tbh=qJ_3m32CMw@mail.gmail.com>
Message-ID: <20130918185155.0c045e28@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 18 Sep 2013 17:34:12 +0200, Thomas De Schampheleire wrote:

> Could you clarify why this is desirable? Note that urls with our
> without trailing slash are not identical: the web server needs to
> properly support this. For example, the autobuild website does not
> properly do it (something very annoying ;) )

I do certainly welcome some help with Apache configuration to make the
rewrite rules behave better. I hate doing sysadmin stuff, so when it
worked more or less, I considered it good enough :)

What I currently have is:

        RewriteEngine on
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteCond %{REQUEST_FILENAME} !-d
        RewriteRule ^/results/([a-f0-9]{3})([a-f0-9]{37})/(.*) /results/$1/$1$2/$3 [L]

this is needed because the old URLs were:

	/results/<complete-hash>/

while the way it's stored (and the new URLs) are:

	/results/<first three chars of hash>/<complete-hash>/

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
