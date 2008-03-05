From: matthias van essche <matthias_van_essche@hotmail.com>
Date: Wed, 5 Mar 2008 12:34:07 +0000
Subject: [Buildroot] lighttpd + php > 503 not found
Message-ID: <BAY128-W17F9404B2F430F7A86F3B5A2110@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I am using buildroot 20887 on a at91sam9260.
After I installed lighttpd and the php interpreter language the webserver only shows .html pages and gives the error 503-not found on .php pages.
I edited the /etc/lighttpd/lighttpd.conf files, uncomenting these lines:

#### fastcgi module
## read fastcgi.txt for more info
## for PHP don't forget to set cgi.fix_pathinfo = 1 in the php.ini
fastcgi.server             = ( ".php" =>
                               ( "localhost" =>
                                 (
                                   "socket" => "/var/run/lighttpd/php-fastcgi.socket",
                                   "bin-path" => "/usr/local/bin/php-cgi"
                                 )
                               )
                            )
#### CGI module

The paths are correct and php is installed.
I woul really be gratefull if you would be so kindly to give me a thought how to solve this problem.

Thanks in advance,
Matthias van Essche

_________________________________________________________________
Bekijk Yes-R's real life soap op MSN Video!
http://video.msn.com/video.aspx?mkt=nl-nl&tab=m1192527562294&vid=8aff5b76-b78d-4b55-8b64-ef7e1d73aab2&playlist=videoByUuids:uuids:50b732c2-c105-41e9-adf0-36bd627d4eaa,0813da8c-031b-423f-a79d-35d925aee805,5cce447e-948d-43af-9862-45bb6bb9d6d8,6a39138c-f562-4254-be70-9d93343650f8,f9b8d78f-05a4-4c74-8e4b-28d20a4037ab&from=NLNL_Yes-R
