From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 17 Jan 2011 13:06:14 +0100
Subject: [Buildroot] qtwebkit illegal instruction problem with external
	toolchain
Message-ID: <AANLkTinGoE2b8t1YA7bu-ontgi++0RaGz9jNN8r_SU5t@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My git head is ca2b65a6515800991dae49d1815b7bb933f4015c.
Compile qt including webkit with external toolchain (codesourcery
default from selection).

Use simple qt code to test webkit:
int main(int argc, char *argv[])
{
        QApplication a(argc, argv);
        QWebView *view = new QWebView();

        view->load(QUrl("http://mrdoob.com/projects/chromeexperiments/ball_pool/"));

	view->showFullScreen();
        return a.exec();
}

After app. starting it failed with Illegal instruction (don't check deeply).

Do same with buildroot builded toolchain (default selection just add
WCHAR and C++ support to be able compile QT).
Application work fine without problem.

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
