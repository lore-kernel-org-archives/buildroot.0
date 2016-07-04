From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Jul 2016 16:07:13 +0200
Subject: [Buildroot] [PATCH 02/83 v2] package/angularjs: simplify
	modules selection
In-Reply-To: <1578b9ca612a91a04bc42601d0fc77a545413868.1467624132.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 4 Jul 2016 11:24:13 +0200")
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <1578b9ca612a91a04bc42601d0fc77a545413868.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <87d1mtfqem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Remove the superfluous config option, and make all modules default to
 > 'y', which provides exactly the same functionality.

 > simplify (and slightly beautify) the handling of modules in the .mk:
 > since the modules' symbols are always meaningful now, we can get rid of
 > the else-clause, and always build the list of modules using the Kconfig
 > options.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

As discussed, the angular sub modules are really small compared to
angular:

ls -lahS target/var/www
total 228K
-rw-r--r-- 1 peko peko 142K Jul  4 16:06 angular.js
-rw-r--r-- 1 peko peko  23K Jul  4 16:06 angular-animate.js
-rw-r--r-- 1 peko peko  11K Jul  4 16:06 angular-message-format.js
-rw-r--r-- 1 peko peko 5.9K Jul  4 16:06 angular-sanitize.js
-rw-r--r-- 1 peko peko 4.3K Jul  4 16:06 angular-route.js
drwxr-xr-x 2 peko peko 4.0K Jul  4 16:06 .
drwxr-xr-x 5 peko peko 4.0K Jul  4 15:58 ..
-rw-r--r-- 1 peko peko 3.7K Jul  4 16:06 angular-aria.js
-rw-r--r-- 1 peko peko 3.6K Jul  4 16:06 angular-resource.js
-rw-r--r-- 1 peko peko 3.6K Jul  4 16:06 angular-touch.js
-rw-r--r-- 1 peko peko 2.6K Jul  4 16:06 angular-messages.js
-rw-r--r-- 1 peko peko 1.7K Jul  4 16:06 angular-loader.js
-rw-r--r-- 1 peko peko 1.4K Jul  4 16:06 angular-cookies.js

So committed after removing the suboptions, thanks.

-- 
Bye, Peter Korsgaard
