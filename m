From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Feb 2016 00:22:13 +0100
Subject: [Buildroot] [PATCH] docs/manual: fixing one liners for vagrant
In-Reply-To: <1454848845-22149-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1454848845-22149-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <56B7D1A5.2080509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07-02-16 13:40, Angelo Compagnucci wrote:
> * Changing back wget to curl cause wget it's not available
>   on mac os x.
> * Braking up too long windows one liner.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  docs/manual/getting.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
> index bb63cab..549938a 100644
> --- a/docs/manual/getting.txt
> +++ b/docs/manual/getting.txt
> @@ -19,13 +19,15 @@ If you want to setup an isolated buildroot environment on Linux or Mac
>  Os X, paste this line onto your terminal:
>  
>  --------------------
> -wget https://buildroot.org/downloads/Vagrantfile; vagrant up
> +curl -O https://buildroot.org/downloads/Vagrantfile; vagrant up

 Ack on this one.

>  --------------------
>  
>  If you are on Windows, paste this into your powershell:
>  
>  --------------------
> -(new-object System.Net.WebClient).DownloadFile("https://buildroot.org/downloads/Vagrantfile","Vagrantfile"); vagrant up
> +(new-object System.Net.WebClient).DownloadFile(
> +"https://buildroot.org/downloads/Vagrantfile","Vagrantfile");

 Does this still work if you cut&paste it with the line break? (Not a windows
user myself...)


 Regards,
 Arnout


> +vagrant up
>  --------------------
>  
>  If you want to follow development, you can use the daily snapshots or
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
