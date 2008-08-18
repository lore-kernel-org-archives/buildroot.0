From: Mikael Sundberg <micke@oddjob.se>
Date: Mon, 18 Aug 2008 21:28:41 +0200
Subject: [Buildroot] undefined reference to `__ctype_tolower_loc'
In-Reply-To: <48A982AB.7040106@oddjob.se>
References: <48A982AB.7040106@oddjob.se>
Message-ID: <48A9CD69.2040808@oddjob.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hm, I think I?ve solved it...

I disabled all widechar and locale features in uclibc, recompiled and 
the error was gone...

I still dont know why I got this error in the first place \=

regards,
Mikael Sundberg

Mikael Sundberg skrev:
> Hi again,
>
> When trying to compile gettext-0.16.1 i get:
> ../intl/.libs/libintl.so: undefined reference to `__ctype_tolower_loc'
> ../intl/.libs/libintl.so: undefined reference to `__ctype_b_loc'
>
> I dont know where to start looking... Is this related to the locale 
> support?
>
> thanks,
> Mikael Sundberg
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>   
